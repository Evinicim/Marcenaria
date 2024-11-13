<%@ page import="java.sql.*, java.math.BigDecimal" %>
<%
    String idProduto = request.getParameter("id");
    if (idProduto == null) {
        response.sendRedirect("listarProdutos.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String nome = "", descricao = "", tipoMadeira = "";
    BigDecimal preco = null;
    java.sql.Date dataInclusao = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marcenaria", "root", "12345");
        
        String query = "SELECT * FROM mcaprodutos WHERE id = ?";
        stmt = con.prepareStatement(query);
        stmt.setInt(1, Integer.parseInt(idProduto));
        rs = stmt.executeQuery();

        if (rs.next()) {
            nome = rs.getString("nome");
            descricao = rs.getString("descricao");
            tipoMadeira = rs.getString("tipo_madeira");
            preco = rs.getBigDecimal("preco");
            dataInclusao = rs.getDate("data_inclusao");
        } else {
            response.sendRedirect("listarProdutos.jsp");
            return;
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Produto</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Editar Produto</h2>
        <form action="AtualizarProdutoServlet" method="post">
            <input type="hidden" name="id" value="<%= idProduto %>">
            <div class="form-group">
                <label>Nome</label>
                <input type="text" name="nome" class="form-control" value="<%= nome %>" required>
            </div>
            <div class="form-group">
                <label>Descrição</label>
                <textarea name="descricao" class="form-control" rows="3" required><%= descricao %></textarea>
            </div>
            <div class="form-group">
                <label>Data Venda</label>
                <input type="date" name="data_inclusao" class="form-control" value="<%= dataInclusao %>" required>
            </div>
            <div class="form-group">
                <label>Preço</label>
                <input type="number" name="preco" class="form-control" step="0.01" value="<%= preco %>" required>
            </div>
            <div class="form-group">
                <label>Tipo de Madeira</label>
                <input type="text" name="tipo_madeira" class="form-control" value="<%= tipoMadeira %>" required>
            </div>
            <button type="submit" class="btn btn-success">Atualizar Produto</button>
        </form>
    </div>
</body>
</html>
