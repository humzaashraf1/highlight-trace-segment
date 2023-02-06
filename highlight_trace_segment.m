load('data.mat')
figure()
frames = size(data,2);
SigFrames = [];
z=1;
for L = 1:size(data,1)
    plot(data(z,:)')
    disp(z)
    title('Select segment then hit enter')
    h = drawline('Color','k');
    w = waitforbuttonpress;
    xlength = round(h.Position(:,1));
        if xlength(2) > frames
            xlength(2) = frames;
        end 
    text(h.Position(1,1),(h.Position(1,2) + h.Position(1,2)*0.25),num2str(xlength(1)))
    hold on
    text(h.Position(2,1),(h.Position(2,2) + h.Position(2,2)*0.25),num2str(xlength(2)))
    title('Hit enter to continue')
    w = waitforbuttonpress;
    frame_end = [];
        if xlength(2) == frames
            frame_end = 0; 
        else
            frame_end = 1;
        end
    SigTemp = [z,frame_end,xlength(1),xlength(2)];
    SigFrames = [SigFrames;SigTemp];
    cla reset
    z=z+1;
end
close all