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

```sh
🚀 Claude Relay Service 初始化设置

✔ 初始化设置完成

✅ 设置完成！

📋 重要信息：

   管理员用户名: cr_admin_fb58bbd2
   管理员密码:   j3PPkETbMX63C3CZ

⚠️  请立即保存这些凭据！首次登录后建议修改密码。

💡 提示: 也可以通过环境变量 ADMIN_USERNAME 和 ADMIN_PASSWORD 预设管理员凭据。

🚀 启动服务：

   npm start              - 启动生产服务
   npm run dev            - 启动开发服务
   npm run cli admin      - 管理员CLI工具

🌐 访问地址：

   Web管理界面: http://localhost:3000/web
   API端点:     http://localhost:3000/api/v1/messages
   健康检查:    http://localhost:3000/health
```

# 构建 Web 管理界面
npm run build:web

# 启动开发服务
npm run dev


curl http://localhost:3000/api/v1/messages \
     --header "x-api-key: cr_1a836d2bca684f7f64ddb3a19063348efba2782d8696b25fa78f8d38a5fc797a" \
     --header "anthropic-version: 2023-06-01" \
     --header "content-type: application/json" \
     --data \
'{
    "model": "claude-sonnet-4-5-20250929",
    "max_tokens": 1024,
    "messages": [
        {"role": "user", "content": "你是 claude-sonnet-4-5 模型吗"}
    ]
}'

ANTHROPIC_BASE_URL="http://localhost:3000/api"
ANTHROPIC_AUTH_TOKEN="cr_1a836d2bca684f7f64ddb3a19063348efba2782d8696b25fa78f8d38a5fc797a"

curl http://localhost:3000/api/v1/models \
     --header "x-api-key: cr_1a836d2bca684f7f64ddb3a19063348efba2782d8696b25fa78f8d38a5fc797a" \
     --header "content-type: application/json"


     : request details: | {"url":"https://api.anthropic.com:443/v1/messages","method":"POST","headers":{"Content-Type":"application/json","Authorization":"Bearer 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","anthropic-version":"2023-06-01","user-agent":"claude-cli/1.0.119 (external, cli)","anthropic-beta":"claude-code-20250219,oauth-2025-04-20,interleaved-thinking-2025-05-14,fine-grained-tool-streaming-2025-05-14"},"body":{"model":"claude-sonnet-4-5-20250929","max_tokens":1024,"messages":[{"role":"[Max Depth Reached]","content":"[Max Depth Reached]"}],"system":[{"type":"[Max Depth Reached]","text":"[Max Depth Reached]","cache_control":"[Max Depth Reached]"}]}}



curl http://localhost:3000/api/v1/messages \
     --header "x-api-key: cr_1a836d2bca684f7f64ddb3a19063348efba2782d8696b25fa78f8d38a5fc797a" \
     --header "anthropic-version: 2023-06-01" \
     --header "content-type: application/json" \
     --data \
'{
    "model": "claude-sonnet-4-5-20250929",
    "max_tokens": 1024,
    "stream": true,
    "messages": [
        {"role": "user", "content": "你是 claude-sonnet-4-5 模型吗"}
    ]
}'

curl https://api.anthropic.com/v1/messages \
     --header "Bearer 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" \
     --header "anthropic-version: 2023-06-01" \
     --header "content-type: application/json" \
     --data \
'{
    "model": "claude-sonnet-4-5-20250929",
    "max_tokens": 1024,
    "messages": [
        {"role": "user", "content": "你是什么模型"}
    ]
}'