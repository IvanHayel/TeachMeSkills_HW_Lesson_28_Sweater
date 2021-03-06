package by.teachmeskills.sweater.entity.user;

import by.teachmeskills.sweater.entity.Entity;
import lombok.*;

@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class Role extends Entity {
    private String name;
    private int accessLevel;

    public Role(int id, @NonNull String name, int accessLevel) {
        this.id = id;
        this.name = name;
        this.accessLevel = accessLevel;
    }
}