#!/bin/bash

# 这个脚本帮助您设置GitHub仓库

echo "==================================="
echo "元素切切乐 - GitHub设置助手"
echo "==================================="
echo ""

# 如果您知道您的GitHub用户名，请修改这里
GITHUB_USERNAME="YOUR_GITHUB_USERNAME"

if [ "$GITHUB_USERNAME" = "YOUR_GITHUB_USERNAME" ]; then
    echo "❗ 请先编辑此文件，将 YOUR_GITHUB_USERNAME 替换为您的GitHub用户名"
    echo ""
    echo "步骤："
    echo "1. 编辑 setup-github.sh 文件"
    echo "2. 将第9行的 YOUR_GITHUB_USERNAME 替换为您的实际用户名"
    echo "3. 保存后重新运行此脚本"
    exit 1
fi

echo "GitHub用户名: $GITHUB_USERNAME"
echo "仓库名称: element-slicer"
echo ""

# 添加远程仓库
echo "正在设置远程仓库..."
git remote add origin https://github.com/$GITHUB_USERNAME/element-slicer.git 2>/dev/null || git remote set-url origin https://github.com/$GITHUB_USERNAME/element-slicer.git

echo "✅ 远程仓库已设置"
echo ""
echo "==================================="
echo "接下来的步骤："
echo "==================================="
echo ""
echo "1️⃣  在GitHub创建仓库："
echo "   访问: https://github.com/new"
echo "   仓库名: element-slicer"
echo "   设为Public公开仓库"
echo "   不要勾选'Initialize this repository with a README'"
echo ""
echo "2️⃣  推送代码到GitHub:"
echo "   运行命令: git push -u origin main"
echo ""
echo "3️⃣  如果提示需要认证:"
echo "   a) 使用Personal Access Token (推荐)"
echo "      - 访问: https://github.com/settings/tokens"
echo "      - 生成新token，勾选'repo'权限"
echo "      - 密码处输入token"
echo "   b) 或使用SSH密钥"
echo "      - 参考: https://docs.github.com/cn/authentication/connecting-to-github-with-ssh"
echo ""
echo "4️⃣  部署到Vercel:"
echo "   访问: https://vercel.com/import"
echo "   选择GitHub仓库部署"
echo ""
echo "==================================="