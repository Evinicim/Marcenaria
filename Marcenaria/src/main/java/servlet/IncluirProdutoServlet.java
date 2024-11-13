package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IncluirProdutoServlet")
public class IncluirProdutoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String precoStr = request.getParameter("preco");
        String tipoMadeira = request.getParameter("tipo_madeira");
        String dataInclusaoStr = request.getParameter("data_inclusao");

        BigDecimal preco = new BigDecimal(precoStr);
        Date dataInclusao = Date.valueOf(dataInclusaoStr);

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marcenaria", "root", "12345")) {
            String sql = "INSERT INTO mcaprodutos (nome, descricao, preco, tipo_madeira, data_inclusao) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setString(1, nome);
                stmt.setString(2, descricao);
                stmt.setBigDecimal(3, preco);
                stmt.setString(4, tipoMadeira);
                stmt.setDate(5, dataInclusao);

                stmt.executeUpdate();
                System.out.println("Produto inserido com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("listarProdutos.jsp?status=success");
    }
}
