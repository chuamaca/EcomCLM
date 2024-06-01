package Beans;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class MAuditoria {

    private Integer Estado;
    private Integer UsuarioCrea;
    private Date FechaCrea;
    private Integer UsuarioModifica;
    private Date FechaModifica;
    private Integer UsuarioElimina;
    private Date FechaElimina;
}
