class RemoteEvaluationController < ApplicationController

  skip_after_action :verify_authorized
  skip_before_action :verify_authenticity_token

  # POST /remote_evaluation/evaluate
  # @param token
  # @exercise_files
  def evaluate
    token = params[:token]
    # todo: im Model nachgucken, ob es zu diesem token einen user und eine exerciseId gibt
    # wenn ja ausführen
    ## submission erstellen (submission create) mit cause "remoteAssess", fileAttributes = exerciseFiles: { Array of {name: Dateiname, content: Inhalt der Datei} } und exercise_id
    ## extra: validiere, ob files wirklich zur Übung gehören (wenn allowNewFiles-flag nicht gesetzt ist)
    # wenn nein und token expired (nach einem Monat): sende antwort, dass token expired und: Log dich ein, suche Übung und update das token
    render :nothing => true
  end
end
