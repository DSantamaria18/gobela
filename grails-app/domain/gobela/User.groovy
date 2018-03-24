package gobela

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String telefono
    String movil
    boolean whatsapp = false

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    String email

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
        email nullable: true, blank: true, email: true
        telefono nullable: true, blank: true
        movil nullable: true, blank: true
    }

    static mapping = {
	    password column: '`password`'
    }
}
