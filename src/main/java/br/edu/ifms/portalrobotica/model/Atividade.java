package br.edu.ifms.portalrobotica.model;

import java.time.LocalDate;

public class Atividade {

	private Long id;
	private String titulo;
	private String tipo;
	private String descricao;
	private LocalDate dataInicio;
	private LocalDate dataFim;
	private String situacao;
	private Long coordenadorId;

	public Atividade() {
	}

	public Atividade(Long id, String titulo, String tipo, String descricao, LocalDate dataInicio, LocalDate dataFim,
			String situacao, Long coordenadorId) {

		this.id = id;
		this.titulo = titulo;
		this.tipo = tipo;
		this.descricao = descricao;
		this.dataInicio = dataInicio;
		this.dataFim = dataFim;
		this.situacao = situacao;
		this.coordenadorId = coordenadorId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public LocalDate getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}

	public LocalDate getDataFim() {
		return dataFim;
	}

	public void setDataFim(LocalDate dataFim) {
		this.dataFim = dataFim;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Long getCoordenadorId() {
		return coordenadorId;
	}

	public void setCoordenadorId(Long coordenadorId) {
		this.coordenadorId = coordenadorId;
	}
}