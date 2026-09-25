#!/bin/bash

# SEO 配置检查脚本
# 用于诊断个人主页的搜索引擎优化问题

echo "=========================================="
echo "🔍 SEO 配置检查工具"
echo "=========================================="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查项目计数
TOTAL_CHECKS=0
PASSED_CHECKS=0
FAILED_CHECKS=0

# 1. 检查 _config.yml 中的 url 设置
echo "1️⃣  检查 _config.yml 中的 URL 配置..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

if grep -q 'url.*:.*"https://zpling.github.io"' _config.yml; then
    echo -e "${GREEN}✅ URL 配置正确${NC}"
    PASSED_CHECKS=$((PASSED_CHECKS+1))
else
    echo -e "${RED}❌ URL 配置错误或缺失${NC}"
    echo "   应该是: url: \"https://zpling.github.io\""
    FAILED_CHECKS=$((FAILED_CHECKS+1))
fi
echo ""

# 2. 检查 Google 验证码
echo "2️⃣  检查 Google Search Console 验证码..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

GOOGLE_VERIFICATION=$(grep "google_site_verification" _config.yml | grep -v "^#" | cut -d: -f2 | tr -d ' "')
if [ -z "$GOOGLE_VERIFICATION" ]; then
    echo -e "${YELLOW}⚠️  未设置 Google 验证码${NC}"
    echo "   需要从 Google Search Console 获取验证码"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
else
    echo -e "${GREEN}✅ Google 验证码已设置: $GOOGLE_VERIFICATION${NC}"
    PASSED_CHECKS=$((PASSED_CHECKS+1))
fi
echo ""

# 3. 检查 Bing 验证码
echo "3️⃣  检查 Bing Webmaster Tools 验证码..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

BING_VERIFICATION=$(grep "bing_site_verification" _config.yml | grep -v "^#" | cut -d: -f2 | tr -d ' "')
if [ -z "$BING_VERIFICATION" ]; then
    echo -e "${YELLOW}⚠️  未设置 Bing 验证码${NC}"
    echo "   需要从 Bing Webmaster Tools 获取验证码"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
else
    echo -e "${GREEN}✅ Bing 验证码已设置: $BING_VERIFICATION${NC}"
    PASSED_CHECKS=$((PASSED_CHECKS+1))
fi
echo ""

# 4. 检查 robots.txt
echo "4️⃣  检查 robots.txt 文件..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

if [ -f "robots.txt" ]; then
    if grep -q "Allow: /" robots.txt && grep -q "Sitemap:" robots.txt; then
        echo -e "${GREEN}✅ robots.txt 配置正确${NC}"
        PASSED_CHECKS=$((PASSED_CHECKS+1))
    else
        echo -e "${YELLOW}⚠️  robots.txt 存在但配置可能不完整${NC}"
        FAILED_CHECKS=$((FAILED_CHECKS+1))
    fi
else
    echo -e "${RED}❌ robots.txt 文件不存在${NC}"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
fi
echo ""

# 5. 检查 sitemap.xml（在 _site 目录）
echo "5️⃣  检查生成的 sitemap.xml..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

if [ -f "_site/sitemap.xml" ]; then
    if grep -q "https://zpling.github.io" _site/sitemap.xml; then
        echo -e "${GREEN}✅ Sitemap 使用完整 URL${NC}"
        PASSED_CHECKS=$((PASSED_CHECKS+1))
        
        # 统计页面数量
        PAGE_COUNT=$(grep -c "<loc>" _site/sitemap.xml)
        echo "   包含 $PAGE_COUNT 个页面"
    else
        echo -e "${RED}❌ Sitemap 使用相对路径（需要完整 URL）${NC}"
        echo "   这是最严重的问题！搜索引擎无法正确抓取"
        FAILED_CHECKS=$((FAILED_CHECKS+1))
    fi
else
    echo -e "${YELLOW}⚠️  未找到生成的 sitemap.xml（可能需要运行 Jekyll）${NC}"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
fi
echo ""

# 6. 检查 Jekyll sitemap 插件
echo "6️⃣  检查 Jekyll sitemap 插件..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

if grep -q "jekyll-sitemap" _config.yml; then
    echo -e "${GREEN}✅ jekyll-sitemap 插件已启用${NC}"
    PASSED_CHECKS=$((PASSED_CHECKS+1))
else
    echo -e "${RED}❌ jekyll-sitemap 插件未配置${NC}"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
fi
echo ""

# 7. 检查 Google 验证文件
echo "7️⃣  检查 Google 验证 HTML 文件..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

GOOGLE_FILE=$(find . -maxdepth 1 -name "google*.html" | head -1)
if [ -n "$GOOGLE_FILE" ]; then
    echo -e "${GREEN}✅ 找到 Google 验证文件: $(basename $GOOGLE_FILE)${NC}"
    PASSED_CHECKS=$((PASSED_CHECKS+1))
else
    echo -e "${YELLOW}⚠️  未找到 Google 验证 HTML 文件${NC}"
    echo "   （如果使用 meta 标签验证，这是正常的）"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
fi
echo ""

# 8. 检查 Bing 验证文件
echo "8️⃣  检查 Bing 验证 XML 文件..."
TOTAL_CHECKS=$((TOTAL_CHECKS+1))

if [ -f "BingSiteAuth.xml" ]; then
    echo -e "${GREEN}✅ 找到 Bing 验证文件: BingSiteAuth.xml${NC}"
    PASSED_CHECKS=$((PASSED_CHECKS+1))
else
    echo -e "${YELLOW}⚠️  未找到 BingSiteAuth.xml${NC}"
    echo "   （如果使用 meta 标签验证，这是正常的）"
    FAILED_CHECKS=$((FAILED_CHECKS+1))
fi
echo ""

# 总结
echo "=========================================="
echo "📊 检查结果总结"
echo "=========================================="
echo ""
echo "总检查项: $TOTAL_CHECKS"
echo -e "${GREEN}通过: $PASSED_CHECKS${NC}"
echo -e "${RED}失败: $FAILED_CHECKS${NC}"
echo ""

# 给出建议
if [ $FAILED_CHECKS -eq 0 ]; then
    echo -e "${GREEN}🎉 恭喜！所有检查都通过了！${NC}"
    echo ""
    echo "接下来的步骤："
    echo "1. 确保已将更改推送到 GitHub"
    echo "2. 等待 2-3 分钟让 GitHub Pages 重新构建"
    echo "3. 在搜索引擎管理后台提交 sitemap"
    echo "4. 等待 1-2 周检查收录状态"
else
    echo -e "${YELLOW}⚠️  发现 $FAILED_CHECKS 个问题需要修复${NC}"
    echo ""
    echo "建议的操作："
    echo ""
    
    # 针对性建议
    if ! grep -q "https://zpling.github.io" _site/sitemap.xml 2>/dev/null; then
        echo "🔧 最优先: 修复 Sitemap URL 格式"
        echo "   执行: git commit --allow-empty -m 'Trigger rebuild' && git push"
        echo "   等待 GitHub Pages 重新生成 sitemap"
        echo ""
    fi
    
    if [ -z "$GOOGLE_VERIFICATION" ]; then
        echo "🔧 获取 Google 验证码"
        echo "   访问: https://search.google.com/search-console/"
        echo "   添加资源: https://zpling.github.io"
        echo "   选择 HTML 标签验证，复制验证码到 _config.yml"
        echo ""
    fi
    
    if [ -z "$BING_VERIFICATION" ]; then
        echo "🔧 获取 Bing 验证码"
        echo "   访问: https://www.bing.com/webmasters/"
        echo "   添加站点: https://zpling.github.io"
        echo "   选择 HTML 元标记验证，复制验证码到 _config.yml"
        echo ""
    fi
fi

echo ""
echo "📚 详细解决方案请查看: 搜索引擎问题诊断和解决方案.md"
echo ""

exit 0

