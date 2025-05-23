const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function(app) {
  app.use(
    '/assets',
    createProxyMiddleware({
      target: 'http://localhost:3000/flutter', // проксируем в папку с билдом Flutter
      pathRewrite: {
        '^/assets': '/assets', // не переписываем сам путь
      },
      changeOrigin: true,
    })
  );

  app.use(
    '/canvaskit',
    createProxyMiddleware({
      target: 'http://localhost:3000/flutter',
      pathRewrite: {
        '^/canvaskit': '/canvaskit',
      },
      changeOrigin: true,
    })
  );
};
