# 🎮 元素切切乐 - 项目操作指南

## 📋 项目概述

这是一个教育类HTML5游戏项目，无需编程知识即可参与。我会负责所有技术实现，您只需提供需求和反馈。

## 🚀 快速开始

### 1. 项目结构
```
element/
├── index.html          # 游戏主文件（所有代码都在这里）
├── README.md           # 项目说明
├── CLAUDE.md          # AI助手参考文档
├── PROJECT_GUIDE.md   # 本文件
├── DESIGN_REVIEW.md   # 设计分析文档
└── .claude/
    └── commands/      # 自定义命令
        ├── start.md   # 创建基础框架
        ├── element.md # 实现元素系统
        ├── slice.md   # 实现切割机制
        ├── behavior.md # 元素特殊行为
        ├── optimize.md # 性能优化
        ├── debug.md   # 调试功能
        └── fix.md     # 修复问题
```

### 2. 开发流程
1. **提出需求** → 2. **AI实现** → 3. **本地测试** → 4. **反馈修改** → 5. **部署上线**

## 🏗️ 架构设计（MVP版本）

### 核心架构原则
```javascript
// 所有代码遵循模块化设计，即使在单文件中
const ElementSlicer = {
    // 1. 配置系统 - 所有可调参数集中管理
    Config: {
        canvas: { width: 800, height: 600 },
        elements: { /* 元素配置 */ },
        difficulty: { /* 难度配置 */ },
        ui: { /* 界面配置 */ }
    },
    
    // 2. 游戏状态 - 全局状态管理
    State: {
        gameState: 'menu', // menu, playing, paused, gameover
        score: 0,
        lives: 3,
        combo: 0,
        level: 1
    },
    
    // 3. 核心系统 - 游戏逻辑模块
    Systems: {
        ElementManager: { /* 元素生成和管理 */ },
        SliceSystem: { /* 切割检测系统 */ },
        EffectSystem: { /* 特效管理系统 */ },
        UISystem: { /* 界面更新系统 */ }
    },
    
    // 4. 工具函数 - 通用功能
    Utils: {
        random: function(min, max) { /* 随机数 */ },
        distance: function(x1, y1, x2, y2) { /* 距离计算 */ },
        lerp: function(a, b, t) { /* 线性插值 */ }
    }
};
```

## 📝 编码规范

### 1. 命名规范
```javascript
// 常量：全大写下划线分隔
const MAX_ELEMENTS = 20;
const SPAWN_INTERVAL = 2000;

// 变量：小驼峰命名
let currentScore = 0;
let playerLives = 3;

// 函数：动词开头的小驼峰
function createElement() { }
function updateScore() { }
function checkCollision() { }

// 类/构造函数：大驼峰命名
class Element { }
class EffectManager { }
```

### 2. 注释规范
```javascript
/**
 * 创建新的化学元素
 * @param {string} type - 元素类型 (normal/toxic/phantom/explosive)
 * @param {number} x - 初始X坐标
 * @param {number} y - 初始Y坐标
 * @returns {Object} 元素对象
 */
function createElement(type, x, y) {
    // 单行注释解释关键逻辑
    const element = {
        type: type,
        x: x,
        y: y,
        velocity: { x: 0, y: -400 }, // 向上的初始速度
        alive: true
    };
    
    return element;
}
```

### 3. 错误处理
```javascript
// 所有用户交互必须包含错误处理
function handleSlice(pointer) {
    try {
        // 检查输入有效性
        if (!pointer || !pointer.x || !pointer.y) {
            console.warn('Invalid pointer data');
            return;
        }
        
        // 执行切割逻辑
        performSlice(pointer);
        
    } catch (error) {
        console.error('切割处理错误:', error);
        // 游戏继续运行，不崩溃
    }
}
```

## 🔄 上下文记忆机制

### 1. 状态持久化
```javascript
// 游戏状态自动保存
const SaveSystem = {
    // 保存到本地存储
    save: function() {
        const saveData = {
            highScore: State.highScore,
            unlockedElements: State.unlockedElements,
            settings: State.settings,
            timestamp: Date.now()
        };
        localStorage.setItem('elementSlicer_save', JSON.stringify(saveData));
    },
    
    // 加载存档
    load: function() {
        const saveData = localStorage.getItem('elementSlicer_save');
        if (saveData) {
            const data = JSON.parse(saveData);
            // 恢复游戏状态
            State.highScore = data.highScore || 0;
            State.unlockedElements = data.unlockedElements || [];
        }
    }
};
```

### 2. 开发日志
```javascript
// 每次重要修改都记录
const DevLog = {
    entries: [],
    
    log: function(action, details) {
        this.entries.push({
            timestamp: new Date().toISOString(),
            action: action,
            details: details,
            version: Config.version
        });
        console.log(`[DevLog] ${action}:`, details);
    }
};

// 使用示例
DevLog.log('FEATURE_ADDED', '添加了生命值系统');
DevLog.log('BUG_FIXED', '修复了切割检测不准确的问题');
```

## 🎯 MVP功能清单

### 第一阶段（核心功能）
- [x] 基础游戏框架
- [ ] 元素生成系统
- [ ] 切割检测机制
- [ ] 得分系统
- [ ] 游戏状态管理

### 第二阶段（完整游戏）
- [ ] 四种元素类型
- [ ] 特殊行为实现
- [ ] 视觉特效
- [ ] 音效系统
- [ ] 暂停/继续

### 第三阶段（优化增强）
- [ ] 移动端适配
- [ ] 性能优化
- [ ] 教育内容
- [ ] 成就系统

## 🛠️ 调试和测试

### 1. 浏览器控制台命令
```javascript
// 在浏览器控制台可用的调试命令
ElementSlicer.debug = {
    // 显示所有元素
    showElements: () => console.table(Systems.ElementManager.elements),
    
    // 修改得分
    setScore: (score) => State.score = score,
    
    // 添加生命
    addLife: () => State.lives++,
    
    // 切换无敌模式
    toggleGodMode: () => State.godMode = !State.godMode
};
```

### 2. 性能监控
```javascript
// FPS显示器
const FPSCounter = {
    fps: 0,
    lastTime: 0,
    
    update: function(time) {
        const delta = time - this.lastTime;
        this.fps = Math.round(1000 / delta);
        this.lastTime = time;
    }
};
```

## 📤 部署流程

### 1. GitHub部署准备
```bash
# 文件结构确认
element/
├── index.html    # 确保这是完整可运行的文件
├── README.md     # 项目说明
└── .gitignore    # 忽略临时文件
```

### 2. Vercel配置
```json
// vercel.json（如果需要）
{
  "version": 2,
  "builds": [
    {
      "src": "index.html",
      "use": "@vercel/static"
    }
  ]
}
```

## 🤝 协作指南

### 给我（AI助手）的指令示例：
1. **功能请求**："添加一个暂停按钮在右上角"
2. **修复问题**："元素飞得太快了，请调慢一点"
3. **优化体验**："在手机上玩的时候元素太小了"
4. **查看进度**："显示当前的开发进度"

### 我会提供的反馈：
1. **实现确认**："已添加暂停功能，按P键或点击按钮暂停"
2. **问题说明**："发现切割检测在高速移动时不准确，正在优化"
3. **进度报告**："MVP核心功能完成60%，预计2小时完成"

## 📊 项目管理

### 版本控制
```javascript
const VERSION = {
    major: 0,  // 主版本：重大更新
    minor: 1,  // 次版本：新功能
    patch: 0,  // 补丁：修复bug
    
    toString() {
        return `${this.major}.${this.minor}.${this.patch}`;
    }
};
```

### 更新日志格式
```markdown
## [0.1.0] - 2024-01-30
### 新增
- 基础游戏框架
- 元素生成系统

### 修复
- 切割检测精度问题

### 优化
- 移动端触摸响应
```

## ⚡ 性能目标

- **帧率**：稳定60 FPS（移动端30 FPS）
- **加载时间**：< 3秒
- **内存占用**：< 50MB
- **响应延迟**：< 16ms

## 🎮 开始开发

现在您可以使用以下命令开始开发：
1. `/start` - 创建基础游戏框架
2. `/element` - 添加元素系统
3. `/slice` - 实现切割功能

每个步骤我都会遵循以上规范，确保代码质量和可维护性。

---

**准备好了吗？** 请告诉我您的GitHub和Vercel token（私信），我们就可以开始构建这个有趣的教育游戏了！