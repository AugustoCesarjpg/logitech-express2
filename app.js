const express = require('express');

const app = express();

app.use(express.json());

// Rotas
app.use('/motoristas', require('./routes/motoristaRoutes'));
app.use('/frotas', require('./routes/frotaRoutes'));
app.use('/ferramentas', require('./routes/ferramentaRoutes'));
app.use('/rotas', require('./routes/rotaRoutes'));
app.use('/entregas', require('./routes/entregaRoutes'));

app.listen(3000, () => {
    console.log('Servidor iniciado.');
});