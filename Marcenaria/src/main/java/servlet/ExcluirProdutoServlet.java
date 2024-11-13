package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/ExcluirProdutoServlet")
public class ExcluirProdutoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obter o ID do produto que deve ser excluído
        int idProduto = Integer.parseInt(request.getParameter("id"));
        
        // Estabelecer a conexão com o banco de dados
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marcenaria", "root", "12345")) {
            // Comando SQL para excluir o produto
            String sql = "DELETE FROM mcaprodutos WHERE id = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, idProduto);
                int resultado = stmt.executeUpdate();

                if (resultado > 0) {
                    // Redirecionar para a página de listagem após a exclusão
                    response.sendRedirect("listarProdutos.jsp");
                } else {
                    response.getWriter().println("Erro ao excluir o produto.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Erro no banco de dados: " + e.getMessage());
        }
     
    }
    
}
