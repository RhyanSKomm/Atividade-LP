package br.edu.ifms.portalrobotica.model;

public class Participacao {

    private Long estudanteId;
    private Long atividadeId;
    private String funcao;
    private String descricaoContribuicao;

    private String estudanteNome;
    private String atividadeTitulo;

    public Participacao() {
    }

    public Participacao(Long estudanteId,
                        Long atividadeId,
                        String funcao,
                        String descricaoContribuicao) {

        this.estudanteId = estudanteId;
        this.atividadeId = atividadeId;
        this.funcao = funcao;
        this.descricaoContribuicao = descricaoContribuicao;
    }

    public Long getEstudanteId() {
        return estudanteId;
    }

    public void setEstudanteId(Long estudanteId) {
        this.estudanteId = estudanteId;
    }

    public Long getAtividadeId() {
        return atividadeId;
    }

    public void setAtividadeId(Long atividadeId) {
        this.atividadeId = atividadeId;
    }

    public String getFuncao() {
        return funcao;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }

    public String getDescricaoContribuicao() {
        return descricaoContribuicao;
    }

    public void setDescricaoContribuicao(String descricaoContribuicao) {
        this.descricaoContribuicao = descricaoContribuicao;
    }

    public String getEstudanteNome() {
        return estudanteNome;
    }

    public void setEstudanteNome(String estudanteNome) {
        this.estudanteNome = estudanteNome;
    }

    public String getAtividadeTitulo() {
        return atividadeTitulo;
    }

    public void setAtividadeTitulo(String atividadeTitulo) {
        this.atividadeTitulo = atividadeTitulo;
    }
}