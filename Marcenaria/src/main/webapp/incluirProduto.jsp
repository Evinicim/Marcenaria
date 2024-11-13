<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Produto</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Adicionar Item vendido</h2>
        <form action="IncluirProdutoServlet" method="post" class="bg-light p-4 rounded shadow-sm">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea name="descricao" id="descricao" class="form-control" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="preco">Preço:</label>
                <input type="number" name="preco" id="preco" class="form-control" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="tipo_madeira">Tipo de Madeira:</label>
                <input type="text" name="tipo_madeira" id="tipo_madeira" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="data_inclusao">Data Venda:</label>
                <input type="date" name="data_inclusao" id="data_inclusao" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Incluir Produto</button>
        </form>
    </div>
    
<div class="text-center mt-4">
            <a href="listarProdutos.jsp" class="btn btn-primary">Veja aqui os produtos</a>
        </div>
        
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
