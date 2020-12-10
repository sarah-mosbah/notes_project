class NotesController < ApplicationController
    before_action :required_current_user

    def index
       @notes=current_user.notes
    end

    def show
        @note= Note.find_by(id:params[:id])
    end


    def edit
        @note= Note.find_by(id:params[:id])
    end


    def new
        @note= Note.new
    end

    def create
        @note = Note.new(note_params)
        @note.user_id=current_user.id
        if @note.save
        redirect_to note_url(@note)
        else
          flash[:errors] = @note.errors.full_messages
          render :new
        end
    end


    def update
        @note= Note.find(params[:id])

        redirect_to notes_path if @note.nil?

        @note.user_id=current_user.id
        if @note.update(note_params)
            redirect_to note_url(@note)
        else
            flash[:errors]= @note.errors.full_messages
            render :edit
        end
        
    end


    private

    def note_params
        params.require(:note).permit(:user_id,:title,:body)
    end

end
