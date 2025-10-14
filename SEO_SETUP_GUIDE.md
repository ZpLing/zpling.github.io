# 搜索引擎收录设置指南

你的网站目前已经可以被Google搜索到了！现在按照以下步骤让百度、Bing等其他搜索引擎也能收录你的网站。

## 📝 操作步骤

### 1️⃣ Bing 网站管理员工具（包括 Edge 浏览器搜索）

**步骤：**

1. 访问：https://www.bing.com/webmasters/
2. 使用微软账号登录（没有的话需要注册一个）
3. 点击"添加站点"
4. 输入你的网站地址：`https://zpling.github.io`
5. 选择验证方式：**"HTML 元标记"**
6. 复制给你的验证码（格式类似：`XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`）
7. 打开 `_config.yml` 文件，找到第19行：
   ```yaml
   bing_site_verification   :  # get bing_site_verification from https://www.bing.com/webmasters/about
   ```
   改为：
   ```yaml
   bing_site_verification   : "你的验证码"  # get bing_site_verification from https://www.bing.com/webmasters/about
   ```
8. 保存文件，推送到GitHub
9. 等待几分钟后，回到Bing网站管理员工具，点击"验证"
10. 验证成功后，提交 Sitemap：`https://zpling.github.io/sitemap.xml`

---

### 2️⃣ 百度搜索资源平台

**步骤：**

1. 访问：https://ziyuan.baidu.com/
2. 注册/登录百度账号
3. 点击"用户中心" -> "站点管理" -> "添加网站"
4. 输入你的网站地址：`https://zpling.github.io`
5. 选择站点类型（选择"个人"）
6. 验证网站归属，选择：**"HTML标签验证"**
7. 复制给你的验证码（格式类似：`codeva-XXXXXXXXXXXXXXXX`）
8. 打开 `_config.yml` 文件，找到第20行：
   ```yaml
   baidu_site_verification  :  # get baidu_site_verification from https://ziyuan.baidu.com/login/index?u=/site/index
   ```
   改为：
   ```yaml
   baidu_site_verification  : "你的验证码"  # get baidu_site_verification from https://ziyuan.baidu.com/login/index?u=/site/index
   ```
9. 保存文件，推送到GitHub
10. 等待几分钟后，回到百度搜索资源平台，点击"完成验证"
11. 验证成功后，在"普通收录"中提交链接或 Sitemap：`https://zpling.github.io/sitemap.xml`

---

### 3️⃣ Google Search Console（可选，如果还没设置）

如果你还没有在Google Search Console设置，建议也完成：

1. 访问：https://search.google.com/search-console/
2. 添加资源：`https://zpling.github.io`
3. 选择"HTML标记"验证
4. 将验证码填入 `_config.yml` 第18行的 `google_site_verification`
5. 提交 Sitemap：`https://zpling.github.io/sitemap.xml`

---

## ✅ 已完成的配置

我已经帮你完成了以下配置：

1. ✅ 创建了 `robots.txt` 文件，允许所有搜索引擎抓取
2. ✅ 在 `_config.yml` 中添加了 `robots.txt` 到 include 列表
3. ✅ SEO meta 标签已配置好（在 `_includes/seo.html` 中）

---

## 📋 接下来要做的事

1. 按照上述步骤获取 Bing 和百度的验证码
2. 更新 `_config.yml` 文件中的验证码
3. 推送更新到 GitHub：
   ```bash
   git add .
   git commit -m "Add Bing and Baidu site verification"
   git push
   ```
4. 在各个搜索引擎后台完成验证
5. 提交 Sitemap

---

## ⏰ 收录时间预期

- **Bing**：通常 1-2 周开始收录
- **百度**：可能需要 2-4 周，有时更长（百度对个人网站收录较慢）
- **Google**：你已经被收录了 ✅

---

## 💡 加快收录的技巧

1. **主动提交链接**：在各搜索引擎的站长工具中主动提交你的页面URL
2. **更新内容**：定期更新网站内容，搜索引擎会更频繁地爬取
3. **外部链接**：在其他网站（如社交媒体、学术平台）分享你的网站链接
4. **添加结构化数据**：可以考虑添加 Schema.org 标记

---

## 🔍 检查收录状态

设置完成后，可以通过以下方式检查收录状态：

- **Bing**：搜索 `site:zpling.github.io`
- **百度**：搜索 `site:zpling.github.io`
- **Google**：搜索 `site:zpling.github.io`

---

**注意**：百度对 GitHub Pages 的收录可能较慢或不稳定，因为：
1. GitHub 在中国访问速度较慢
2. 百度对国外服务器的网站收录相对保守

如果长期无法被百度收录，可以考虑使用国内的CDN加速服务（如七牛云、又拍云等）。

