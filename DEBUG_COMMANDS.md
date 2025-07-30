# 游戏调试命令

在浏览器控制台（F12）中输入这些命令来测试游戏功能：

## 1. 查看当前游戏状态
```javascript
// 查看所有状态
ElementSlicer.State

// 查看当前分数
ElementSlicer.State.score

// 查看生命值
ElementSlicer.State.lives
```

## 2. 查看元素配置
```javascript
// 查看所有元素类型
ElementSlicer.Config.elements.types

// 查看版本
ElementSlicer.Config.version
```

## 3. 调试功能
```javascript
// 直接设置分数到290（接近胜利）
ElementSlicer.debug.setScore(290)

// 添加生命值
ElementSlicer.debug.addLife()

// 显示当前状态表格
ElementSlicer.debug.showState()
```

## 4. 查看当前场景中的元素
```javascript
// 获取游戏场景
const scene = ElementSlicer.gameInstance.scene.getScene('GameScene')

// 查看当前元素数量
scene.elements.children.entries.length

// 查看所有元素信息
scene.elements.children.entries.map(e => ({
    type: e.elementType,
    symbol: e.symbol,
    position: {x: e.x, y: e.y},
    health: e.health
}))
```

## 5. 手动生成特定元素
```javascript
// 获取场景
const scene = ElementSlicer.gameInstance.scene.getScene('GameScene')

// 在控制台执行这个来生成一个爆裂元素
scene.time.delayedCall(100, () => {
    // 临时修改权重，强制生成爆裂元素
    const originalSpawn = scene.spawnElement.bind(scene);
    scene.spawnElement = function() {
        const x = 400;
        const y = 650;
        const element = this.add.circle(x, y, 40, 0xFF4444);
        this.physics.add.existing(element);
        element.body.setVelocity(0, -400);
        element.body.setGravity(0, 300);
        element.elementType = 'explosive';
        element.symbol = 'Li';
        element.score = 0;
        element.damage = 1;
        element.health = 1;
        element.isSliced = false;
        
        const symbolText = this.add.text(x, y, 'Li', {
            fontSize: '28px',
            fontFamily: 'Arial',
            color: '#FFFFFF',
            stroke: '#000000',
            strokeThickness: 2
        }).setOrigin(0.5);
        
        element.symbolText = symbolText;
        
        // 脉动效果
        this.tweens.add({
            targets: element,
            scaleX: 1.1,
            scaleY: 1.1,
            duration: 500,
            yoyo: true,
            repeat: -1,
            ease: 'Sine.easeInOut'
        });
        
        this.elements.add(element);
    };
    scene.spawnElement();
    scene.spawnElement = originalSpawn;
});
```

## 6. 查看开发日志
```javascript
// 查看所有日志
ElementSlicer.DevLog.entries

// 查看最近5条日志
ElementSlicer.DevLog.entries.slice(-5)
```