package com.xenogears.cotizacion.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.xenogears.cotizacion.model.ConfigVariable;
import com.xenogears.cotizacion.repository.ConfigVariableRepositoryCustom;

public class ConfigVariableRepositoryImpl implements ConfigVariableRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<ConfigVariable> listarTablas() {
		TypedQuery<ConfigVariable> query = entityManager.createQuery(""
				+ "Select c from ConfigVariable c where c.padre.idConfigVariable = null and"
				+ " c.flagEstado = true", ConfigVariable.class);
		return query.getResultList();
	}

	@Override
	public List<ConfigVariable> obtenerPorid(Integer id) {
		TypedQuery<ConfigVariable> query = entityManager.createQuery(""
				+ "Select c from ConfigVariable c where c.padre.idConfigVariable = :id and"
				+ " c.flagEstado = true", ConfigVariable.class);
			query.setParameter("id", id);

		return query.getResultList();
	}
	
	public String obtenerDescripcion(Integer id){
		TypedQuery<ConfigVariable> query = entityManager.createQuery(""
				+ "Select c from ConfigVariable c where c.padre.idConfigVariable = :id and"
				+ " c.flagEstado = true", ConfigVariable.class);
		query.setParameter("id", id);
		System.out.println(query);
		return "uno";
	}

	@Override
	public List<ConfigVariable> listarPorTabla() {
		TypedQuery<ConfigVariable> query = entityManager.createQuery(""
				+ "Select c from ConfigVariable c where"
				+ " c.flagEstado = true order by c.padre.idConfigVariable,c.descripcion", ConfigVariable.class);
		return query.getResultList();
	}
	
}
