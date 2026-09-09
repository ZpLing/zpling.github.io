import json
import os
import sys
from datetime import datetime

from scholarly import ProxyGenerator, scholarly

# Google Scholar serves a CAPTCHA to datacenter IPs, which is what every GitHub
# Actions runner has. A direct fetch usually fails there, so try progressively
# more expensive strategies and use whichever one gets through first.
def strategies():
    yield 'direct', lambda: True

    key = os.environ.get('SCRAPERAPI_KEY', '').strip()
    if key:
        def scraperapi():
            pg = ProxyGenerator()
            if not pg.ScraperAPI(key):
                return False
            scholarly.use_proxy(pg)
            return True
        yield 'scraperapi', scraperapi

    def freeproxies():
        pg = ProxyGenerator()
        if not pg.FreeProxies():
            return False
        scholarly.use_proxy(pg)
        return True
    yield 'free proxies', freeproxies


def fetch(scholar_id):
    last_error = None
    for label, activate in strategies():
        print(f'--- trying {label} ---', flush=True)
        try:
            if not activate():
                print(f'{label}: could not be set up, skipping', flush=True)
                continue
            author = scholarly.search_author_id(scholar_id)
            scholarly.fill(author, sections=['basics', 'indices', 'counts', 'publications'])
            print(f'{label}: success', flush=True)
            return author
        except Exception as e:  # noqa: BLE001 - any failure means try the next strategy
            last_error = e
            print(f'{label}: failed ({type(e).__name__}: {e})', flush=True)
    raise SystemExit(
        f'Could not fetch Google Scholar data by any method. Last error: {last_error}\n'
        'Google Scholar blocks GitHub Actions runner IPs. For a reliable crawl, set a '
        'SCRAPERAPI_KEY repository secret (scraperapi.com has a free tier).'
    )


scholar_id = os.environ.get('GOOGLE_SCHOLAR_ID', '').strip()
if not scholar_id:
    sys.exit("GOOGLE_SCHOLAR_ID is empty or unset. Set it as a repository secret "
             "(the 'user=' value in your Google Scholar profile URL).")

author = fetch(scholar_id)
author['updated'] = str(datetime.now())
author['publications'] = {v['author_pub_id']: v for v in author['publications']}
print(json.dumps(author, indent=2))

os.makedirs('results', exist_ok=True)
with open('results/gs_data.json', 'w') as outfile:
    json.dump(author, outfile, ensure_ascii=False)

shieldio_data = {
    "schemaVersion": 1,
    "label": "citations",
    "message": f"{author['citedby']}",
}
with open('results/gs_data_shieldsio.json', 'w') as outfile:
    json.dump(shieldio_data, outfile, ensure_ascii=False)
