function MoveAppCenter(app)
            screen=get(0,'ScreenSize');
            app_pos=app.Position;
            app_pos(1)=(screen(3)-app_pos(3))/2;
            app_pos(2)=(screen(4)-app_pos(4))/2;
            app.Position=app_pos;
end

