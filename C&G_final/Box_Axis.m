
function Box_Axis(ax,xlim,ylim,zlim)
%this function use to bulid a box_axis
%ax is the axis
%xlim is [xmin xmax],ylim and zlim same
plot3(ax,[xlim(1) xlim(2)],[ylim(2) ylim(2)],[zlim(2) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(1) xlim(2)],[ylim(2) ylim(2)],[zlim(1) zlim(1)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(1) xlim(2)],[ylim(1) ylim(1)],[zlim(2) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(1) xlim(2)],[ylim(1) ylim(1)],[zlim(1) zlim(1)],'k','linewidth',1)
hold(ax,'on')

plot3(ax,[xlim(1) xlim(1)],[ylim(1) ylim(2)],[zlim(2) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(2) xlim(2)],[ylim(1) ylim(2)],[zlim(2) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(2) xlim(2)],[ylim(1) ylim(2)],[zlim(1) zlim(1)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(1) xlim(1)],[ylim(1) ylim(2)],[zlim(1) zlim(1)],'k','linewidth',1)
hold(ax,'on')

plot3(ax,[xlim(2) xlim(2)],[ylim(1) ylim(1)],[zlim(1) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(1) xlim(1)],[ylim(2) ylim(2)],[zlim(1) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(1) xlim(1)],[ylim(1) ylim(1)],[zlim(1) zlim(2)],'k','linewidth',1)
hold(ax,'on')
plot3(ax,[xlim(2) xlim(2)],[ylim(2) ylim(2)],[zlim(1) zlim(2)],'k','linewidth',1)
hold(ax,'on')
