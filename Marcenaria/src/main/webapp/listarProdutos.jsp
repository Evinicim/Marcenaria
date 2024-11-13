<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Produtos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .action-buttons {
            display:flex;
    
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Lista de Produtos</h2>

        <!-- Mensagem de confirmação -->
        <% 
        String status = request.getParameter("status");
        if ("success".equals(status)) {
        %>
            <div class="alert alert-success">Produto adicionado com sucesso!</div>
        <%
        }
        %>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                    <th>Tipo de Madeira</th>
                    <th>Data Venda   </th>
                    <th>Controle</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marcenaria", "root", "12345");
                    String sql = "SELECT * FROM mcaprodutos";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= rs.getString("nome") %></td>
                    <td><%= rs.getString("descricao") %></td>
                    <td><%= rs.getBigDecimal("preco") %></td>
                    <td><%= rs.getString("tipo_madeira") %></td>
                    <td><%= rs.getDate("data_inclusao") %></td>
                    <td class="action-buttons">
                        <!-- Link para editar o produto -->
                        <a href="editarProduto.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Editar</a>
                        <!-- Link para excluir o produto -->
                        <a href="ExcluirProdutoServlet?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir este produto?');">Excluir</a>
                    </td>
                </tr>
                <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>

        <!-- Botão para adicionar um novo produto -->
        <div class="text-center mt-4">
            <a href="incluirProduto.jsp" class="btn btn-primary">Adicionar Novo Produto</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
