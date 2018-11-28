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
    String email
    String movil
    boolean whatsapp = false
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Date dateCreated
    Date lastUpdated
    String nombre
    String apellidos
    String resetToken
    Date resetTokenFecha

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
        email nullable: true, blank: true, email: true
        movil nullable: true, blank: true
        whatsapp()
        nombre nullable: false, blank: false
        apellidos nullable: false, blank: false
        resetToken nullable: true, unique: true
        resetTokenFecha nullable: true
    }

    static mapping = {
	    password column: '`password`'
    }
}
