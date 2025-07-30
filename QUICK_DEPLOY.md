# 🚀 快速部署指南

## 第一步：准备GitHub

### 1.1 创建GitHub仓库
👉 打开浏览器访问: https://github.com/new

填写以下信息：
- Repository name: `element-slicer`
- Description: `化学元素切切乐游戏 - 教育类HTML5游戏`
- 选择: Public
- ❌ 不要勾选任何初始化选项

点击 "Create repository"

### 1.2 复制您的用户名
创建完成后，页面会显示类似这样的命令：
```
git remote add origin https://github.com/YOUR_USERNAME/element-slicer.git
```
记下您的 YOUR_USERNAME

## 第二步：推送代码

在终端运行以下命令（替换YOUR_USERNAME为您的实际用户名）：

```bash
# 1. 设置远程仓库
git remote add origin https://github.com/YOUR_USERNAME/element-slicer.git

# 2. 推送代码
git push -u origin main
```

### 如果提示输入密码：
- Username: 您的GitHub用户名
- Password: 您的Personal Access Token（不是GitHub密码！）

### 获取Personal Access Token：
1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. Note: `element-slicer-deploy`
4. 勾选 `repo` 权限
5. 点击 Generate token
6. 复制token（只显示一次！）

## 第三步：部署到Vercel

### 方案A：通过GitHub部署（推荐）
1. 访问 https://vercel.com
2. 点击 "Add New..." → "Project"
3. 在 "Import Git Repository" 部分
4. 如果没看到仓库，点击 "Add GitHub Account"
5. 授权后选择 `element-slicer`
6. 点击 "Import"
7. 直接点击 "Deploy"（使用默认设置）

### 方案B：直接上传部署
1. 访问 https://vercel.com/new
2. 选择 "Deploy without Git provider"
3. 拖拽整个 `element` 文件夹到页面
4. 等待上传完成
5. 点击 "Deploy"

## 第四步：访问游戏

部署成功后，您会获得一个URL，例如：
- `https://element-slicer-xxxxx.vercel.app`

用手机或电脑浏览器打开即可玩游戏！

## 🎮 游戏操作说明

- **PC端**：鼠标滑动切割元素
- **移动端**：手指滑动切割元素
- **目标**：达到300分
- **暂停**：按P键（仅PC端）

## 📝 更新游戏

当您需要更新游戏时：
```bash
git add .
git commit -m "更新说明"
git push
```
Vercel会自动部署最新版本！

## ❓ 常见问题

**Q: push失败提示认证错误**
A: 确保使用Personal Access Token而不是密码

**Q: Vercel部署失败**
A: 检查是否选择了正确的仓库和分支(main)

**Q: 游戏加载慢**
A: 首次加载需要下载Phaser库，之后会缓存

---

需要帮助？告诉我具体遇到的问题！