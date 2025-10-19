# 使用 Docker 启动 Redis
docker run -d --name claude-relay-redis -p 6379:6379 -v redis-data:/data redis:7-alpine redis-server --appendonly yes

# 测试连接
docker exec -it claude-relay-redis redis-cli ping

# 安装后端依赖
npm install
# 安装前端管理界面依赖
npm run install:web

# 复制环境变量模板
cp .env.example .env

# 复制配置文件模板
cp config/config.example.js config/config.js

# 编辑环境配置
# 服务器配置
PORT=3000
HOST=localhost
NODE_ENV=development

# 安全配置 - 开发环境可以使用默认值
JWT_SECRET=your-development-jwt-secret
ENCRYPTION_KEY=your-development-encryption-key-32

# Redis 配置
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=
REDIS_DB=0

# Claude API 配置
CLAUDE_API_URL=https://api.anthropic.com/v1/messages
CLAUDE_API_VERSION=2023-06-01

# 运行初始化脚本
npm run setup

# 构建 Web 管理界面
npm run build:web

# 启动开发服务
npm run dev