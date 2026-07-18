---
permalink: /
title: "Zipeng Ling"
excerpt: "Researcher"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

<span class='anchor' id='about-me'></span>

Hello, and welcome to my website! I am Zipeng Ling, a fully funded thesis-based M.Sc. student at the [University of Alberta](https://www.ualberta.ca/en/index.html), majoring in Computing Science. Prior to this, I obtained my B.Eng. degree in Communication Engineering from [Nanjing University of Posts and Telecommunications](https://www.njupt.edu.cn/en/).

Throughout my academic journey, I have been fortunate to receive support from mentors and collaborators. Previously, I spent memorable time with Prof. [Huaxiu Yao](https://www.huaxiuyao.io/). In addition, I had the privilege of working with Prof. [Xuming Hu](https://xuminghu.github.io). Before that, I was fortunate to be advised by Prof. [Shichao Pei](https://scpei.github.io/). Earlier, my research began under the supervision of Prof. [Zhuying Li](https://zhuyingli.info/). I am also honored to work alongside [Yue Huang](https://howiehwong.github.io/), who has always offered me guidance throughout this stressful yet rewarding journey. Last but not least, I am grateful for my long-term collaboration with Prof. [Yao Wan](http://wanyao.me/).


<!-- <span style="font-family: 'Georgia', 'Times New Roman', serif; font-style: italic; color: #2c5aa0; font-weight: bold;">"Try something, you may succeed, you may fail. But make it your life's work to remake the world."</span> -----Tim Cook -->


# 💡 Research Interests
- **LLM Reasoning**: While LLMs can solve extremely challenging problems and output correct labels, their reasoning traces and thinking paradigms often remain flawed and unclear.
- **AI Agent**: We study how agentic systems plan, collaborate and execute to solve complex tasks through multi-step decision-making.
- **Retrieval-Augmented Generation (RAG)**: Optimizing how LLMs retrieve, comprehend, and make use of multi-modal information in databases for generation.


<!-- My research interest includes neural machine translation and computer vision.  <a href='https://scholar.google.com/citations?user=DhtAFkwAAAAJ'>google scholar citations <strong><span id='total_cit'>260000+</span></strong></a> (You can also use google scholar badge <a href='https://scholar.google.com/citations?user=DhtAFkwAAAAJ'><img src="https://img.shields.io/endpoint?url={{ url | url_encode }}&logo=Google%20Scholar&labelColor=f6f6f6&color=9cf&style=flat&label=citations"></a>). -->


# 🔥 News
- *2025.08*: &nbsp;🎉 One paper is accepted by EMNLP 2025!
- *2025.06*: &nbsp;🎉 Graduated from NJUPT today, thanks for four years!
- *2023.09*: &nbsp;🎉 Finished my Software Engineer internship at Bosch!

[//]: # (- *2022.02*: &nbsp;🎉🎉 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare aliquet ipsum, ac tempus justo dapibus sit amet. )

# 📝 Publications

- **LLM Abstention Can Be a Prompt Artifact, in Addition to Genuine Uncertainty** [[PDF]](https://www.arxiv.org/pdf/2507.16199)  [[Code]](https://github.com/WakenLLMTeam/WakenLLM-toolkit)<br>
**Zipeng Ling\***, Shuliang Liu\*, Yuehao Tang\*, Junqi Yang\*, Shenghong Fu\*, Seonil Son, Chen Huang, Kejia Huang, Yao Wan, Zhichao Hou, Xuming Hu.<br>
**Preprint**


- **Objective Bias, Subjective Bias, or Both: Benchmarking LLMs on Different Question Forms and Instruction Settings** [[PDF]](https://www.arxiv.org/pdf/2509.20278)  [[Code]](https://github.com/ZpLing/Instruction-Boundary)<br>
**Zipeng Ling\***, Shuliang Liu\*, Yuehao Tang\*, Chen Huang\*, Gaoyang Jiang, Shenghong Fu, Seonil Son, Junqi Yang, Yao Wan, Jiawan Zhang, Kejia Huang, Xuming Hu.<br>
**Preprint**


- **Correct Prediction, Wrong Steps? Consensus Reasoning Knowledge Graph for Robust Chain-of-Thought Synthesis** [[PDF]](https://arxiv.org/pdf/2604.14121)  [[Code]](https://github.com/ZpLing/CRAFT)<br>
**Zipeng Ling**, Shuliang Liu, Shenghong Fu, Yuehao Tang, Seonil Son, Yao Wan, Xuming Hu.<br>
**Preprint**


<!-- - <span class="badge" style="position: relative; display: inline-block; margin-right: 0.5em; margin-top: 0; margin-left: 0;">preprint</span> **Evaluating and Improving Reasoning Traces  via Fine-Grained and Term-Driven Analysis** [Arxiv TBD] [Code TBD] **Zipeng Ling**, Zhaoyang Wang, Shi Qiu, Huaxiu Yao. -->

- **Omni-SimpleMem: Autoresearch-Guided Discovery of Lifelong Multimodal Agent Memory** [[PDF]](https://arxiv.org/pdf/2604.01007)  [[Code]](https://github.com/aiming-lab/SimpleMem)<br>
Jiaqi Liu, **Zipeng Ling**, Shi Qiu, Yanqing Liu, Siwei Han, Peng Xia, Haoqin Tu, Zeyu Zheng, Cihang Xie, Charles Fleming, Mingyu Ding, Huaxiu Yao.<br>
**Preprint**


- **Dissecting Logical Reasoning in LLMs: A Fine-Grained Evaluation and Supervision Study** [[PDF]](https://arxiv.org/pdf/2506.04810)  [[Code]](https://github.com/YujunZhou/Logical)<br>
Yujun Zhou\*, Jiayi Ye\*, **Zipeng Ling\***, Yufei Han, Yue Huang, Haomin Zhuang, Zhenwen Liang, Kehan Guo, Taicheng Guo, Xiangqi Wang, Xiangliang Zhang.<br>
**EMNLP Findings 2025**


- **UXBench: Measuring the Actionability of LLM-Generated UX Critiques** [[PDF]](https://arxiv.org/pdf/2606.16262)  [[Code]](https://github.com/Jackwwj619/UXBench)<br>
Wenjie Wang, Yue Huang, **Zipeng Ling**, Han Bao, Hang Hua, Xiaonan Luo, Yu Jiang, Shiyi Du, Yuexing Hao, Xiaomin Li, Yuchen Ma, Dianzhuo Wang, Yanfang Ye, Xiangliang Zhang.<br>
**Preprint**


<!-- - **When Simulation Lies: A Sim-to-Real Benchmark and Domain-Randomized RL Recipe for Tool-Use Agents** [[PDF]](https://arxiv.org/pdf/2605.11928)<br>
Xiaolin Zhou, Aojie Yuan, Zheng Luo, **Zipeng Ling**, Xixiao Pan, Yicheng Gao, Haiyue Zhang, Jiate Li, Shuli Jiang, Prince Zizhuang Wang, Zixuan Zhu, Jinbo Liu, Ryan A. Rossi, Hua Wei, Xiyang Hu.<br>
**FAGEN@ICML 2026 Poster**


- **NARRA-Gym for Evaluating Interactive Narrative Agents** [[PDF]](https://arxiv.org/pdf/2605.08503)<br>
Yue Huang, Yuchen Ma, Jiayi Ye, Wenjie Wang, **Zipeng Ling**, Xingjian Hu, Yuexing Hao, Zichen Chen, Zhangchen Xu, Yunhong He, Zhengqing Yuan, Yujun Zhou, Kehan Guo, Chaoran Chen, Toby Jia-Jun Li, Stefan Feuerriegel, Xiangliang Zhang.<br>
**Preprint** -->




# 💻 Work Experiences

- **Alberta Machine Intelligence Institute (Amii)**. Alberta, Canada.

  *2026.09 – 2028. 06:* Student Researcher


- **Bosch**. Suzhou, China.

  *2025.08 – 2026.08:* NLP Research Intern<br>
  *2023.06 – 2023.09:* Software Engineer Intern

<!-- *2021.09* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare aliquet ipsum, ac tempus justo dapibus sit amet. -->

# 📖 Education
- **University of Alberta**. Edmonton, Canada.

  *2026.09 - 2028.06:* Fully Funded Thesis-Based M.Sc., Computing Science.



- **Nanjing University of Posts and Telecommunications**. Nanjing, China.

  *2021.09 - 2025.06:* B.Eng., Communication Engineering, 


# 🎖 Honors and Services
- Merit-based Scholarship. 4,000 CNY.
- Conference Reviewer: AAAI 2026, ARR March 2026, AAAI 2027.

<!-- # 👨‍🏫 Mentoring
- *2025.07 - now*: Chen Huang, Undergrad at Huazhong University of Science and Technology. -->

# 🎯 Misc.

- I was born in Suzhou, China, a city long famous for its prosperous economy and beautiful gardens 🏙️, where [EMNLP 2025](https://2025.emnlp.org) was held.

- As for my taste 🍜, contrary to the stereotype many people may have about locals, I can handle 🌶️ spicy food (Sichuan cuisine) very well!

- I love playing video games 🎮! My Valorant ranking in Asian servers (particularly Hong Kong and Tokyo) has reached **Platinum**.

- I am grateful for those who help me along this way ❤️.
