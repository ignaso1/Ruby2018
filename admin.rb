# Admin class used as a base for other classes
class Admin
    def getUserList(userList)
        return userList.fetch()
    end

    def getProjectList(projectList)
        return projectList.fetch()
    end

    def getResourceInformation(resourceList)
        return resourceList.fetch()
    end

    def getProjectInformation(projectList)
        return projectList.fetch()
    end

    def changeUserPassword(newPassword, user_id, password_value)
        projectList.password_value = newPassword;
    end

    def changeUserRole(userList, user_id, role_type)
        userList.role_type = new_role_type;

    end

    def deleteUserAccount(user_id, userList)
        userList.delete(user_id)
    end

    def deleteResource(resource_id, resourceList)
        resourceList.delete(resource_id)
    end

    def deleteProject(project_id, projectList)
        projectList.delete(project_id)
    end

    def addComment(comment, commentList)
        commentList.push(comment);
    end
    
end