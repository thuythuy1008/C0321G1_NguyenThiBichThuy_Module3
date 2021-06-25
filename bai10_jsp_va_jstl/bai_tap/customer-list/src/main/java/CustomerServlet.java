import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {""})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://1.bp.blogspot.com/-WuxmNotEkM0/XowLMlnulDI/AAAAAAAAbcQ/25fdsH1pXascGhlz7bN_A1VYjpcSOLZ4gCLcBGAsYHQ/s1600/Trai-dep-che-mat-chat%2B%25283%2529.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://1.bp.blogspot.com/-7x7rYRDTWRo/XowLI8m-n4I/AAAAAAAAbbg/R5lprlk7C1kOfkOWO3ddSFyWZsX8g-lmACLcBGAsYHQ/s1600/Trai-dep-che-mat-chat%2B%252815%2529.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://ttol.vietnamnetjsc.vn/images/2018/12/26/10/35/goc-nghieng-than-thanh-6.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://1.bp.blogspot.com/-vdrYDhQm74o/XowLJtXxIsI/AAAAAAAAbbs/7b_l0Oceysw9JF541rMZnTWyZj3hNoyYgCLcBGAsYHQ/s1600/Trai-dep-che-mat-chat%2B%252817%2529.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://ttol.vietnamnetjsc.vn/images/2018/12/26/10/34/goc-nghieng-than-thanh-2.jpg"));
        request.setAttribute("customer",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }
}