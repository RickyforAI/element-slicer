#!/bin/bash

echo "元素切切乐 - 部署脚本"
echo "====================="
echo ""
echo "请选择部署方式："
echo "1. 创建GitHub仓库链接（需要先在GitHub创建仓库）"
echo "2. 推送到已有的GitHub仓库"
echo "3. 显示部署指南"
echo ""
read -p "请输入选项 (1-3): " choice

case $choice in
    1)
        read -p "请输入您的GitHub用户名: " username
        if [ -z "$username" ]; then
            echo "错误：用户名不能为空"
            exit 1
        fi
        
        # 检查是否已有远程仓库
        if git remote | grep -q "origin"; then
            echo "已存在远程仓库，正在更新..."
            git remote set-url origin https://github.com/$username/element-slicer.git
        else
            echo "添加远程仓库..."
            git remote add origin https://github.com/$username/element-slicer.git
        fi
        
        echo ""
        echo "远程仓库已设置为: https://github.com/$username/element-slicer.git"
        echo ""
        echo "现在请："
        echo "1. 在GitHub创建名为 'element-slicer' 的新仓库"
        echo "2. 运行: git push -u origin main"
        echo "3. 在GitHub仓库Settings中启用Pages功能"
        ;;
        
    2)
        echo "检查Git状态..."
        git status
        
        read -p "是否继续推送? (y/n): " confirm
        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            echo "推送到GitHub..."
            git push -u origin main
            
            if [ $? -eq 0 ]; then
                echo ""
                echo "✅ 推送成功！"
                echo ""
                echo "下一步："
                echo "1. 访问Vercel.com"
                echo "2. 导入GitHub仓库"
                echo "3. 选择 element-slicer 项目"
                echo "4. 点击Deploy部署"
            else
                echo ""
                echo "❌ 推送失败"
                echo "可能需要先设置GitHub token或SSH密钥"
                echo "参考: https://docs.github.com/cn/authentication"
            fi
        fi
        ;;
        
    3)
        echo ""
        cat DEPLOY.md
        ;;
        
    *)
        echo "无效选项"
        exit 1
        ;;
esac