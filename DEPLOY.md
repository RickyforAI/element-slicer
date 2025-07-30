# 部署指南 - 元素切切乐

## 方法1：通过GitHub页面部署（最简单）

### 步骤1：创建GitHub仓库
1. 访问 https://github.com/new
2. 仓库名称：`element-slicer`
3. 设置为公开仓库
4. 不要初始化README（我们已经有了）

### 步骤2：推送代码
```bash
# 在项目目录执行
cd /home/ubuntu/ricky/projects/element

# 添加远程仓库（替换YOUR_USERNAME）
git remote add origin https://github.com/YOUR_USERNAME/element-slicer.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤3：启用GitHub Pages
1. 进入仓库设置 Settings
2. 找到 Pages 部分
3. Source 选择 "Deploy from a branch"
4. Branch 选择 "main" 和 "/ (root)"
5. 保存后等待几分钟
6. 访问 https://YOUR_USERNAME.github.io/element-slicer

## 方法2：通过Vercel部署（推荐）

### 选项A：Vercel网页部署
1. 访问 https://vercel.com
2. 点击 "Import Project"
3. 选择 "Import Git Repository"
4. 授权GitHub访问
5. 选择 element-slicer 仓库
6. 点击 Deploy

### 选项B：Vercel CLI部署
```bash
# 安装Vercel CLI
npm i -g vercel

# 登录（会打开浏览器）
vercel login

# 部署
vercel --prod

# 按提示操作：
# - Set up and deploy: Y
# - Which scope: 选择你的账户
# - Link to existing project: N
# - Project name: element-slicer
# - Directory: ./
# - Override settings: N
```

## 方法3：直接拖拽部署

1. 访问 https://vercel.com/new
2. 选择 "Deploy without Git"
3. 拖拽整个 element 文件夹到页面上
4. 等待上传和部署完成

## 部署后测试

无论使用哪种方法，部署成功后您会得到一个URL，例如：
- GitHub Pages: https://username.github.io/element-slicer
- Vercel: https://element-slicer.vercel.app

在手机或电脑浏览器打开即可测试游戏。

## 更新部署

### GitHub Pages更新
```bash
git add .
git commit -m "更新描述"
git push
# GitHub Pages会自动更新
```

### Vercel更新
- 如果连接了Git：推送到GitHub自动更新
- 如果使用CLI：再次运行 `vercel --prod`

## 常见问题

1. **游戏加载慢**
   - Phaser库从CDN加载，首次可能较慢
   - 可以考虑下载到本地

2. **触摸不灵敏**
   - 已针对移动端优化
   - 如有问题请反馈具体机型

3. **部署失败**
   - 检查文件路径是否正确
   - 确保index.html在根目录

需要帮助请告诉我！