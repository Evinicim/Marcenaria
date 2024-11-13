package servlet;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/AtualizarProdutoServlet")
public class AtualizarProdutoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String dataInclusaoStr = request.getParameter("data_inclusao");
        String precoStr = request.getParameter("preco");
        String tipoMadeira = request.getParameter("tipo_madeira");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marcenaria", "root", "12345")) {
            String sql = "UPDATE mcaprodutos SET nome = ?, descricao = ?, data_inclusao = ?, preco = ?, tipo_madeira = ? WHERE id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, nome);
            stmt.setString(2, descricao);
            stmt.setDate(3, Date.valueOf(dataInclusaoStr));
            stmt.setBigDecimal(4, new BigDecimal(precoStr));
            stmt.setString(5, tipoMadeira);
            stmt.setInt(6, id);
            stmt.executeUpdate();

            response.sendRedirect("listarProdutos.jsp");
        } catch (SQLException | IllegalArgumentException e) {
            e.printStackTrace();
            response.getWriter().println("Erro ao atualizar produto: " + e.getMessage());
        }
    }
}
