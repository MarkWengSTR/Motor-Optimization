function torque = calc_torque(g)

fem_name = sprintf('test.fem');
mi_saveas(fem_name);
mi_analyze(1)
mi_loadsolution

%mo_selectblock(mean([g.s.p5; g.s.p6; g.s.p7; g.s.p8])'); %stator
% mo_groupselectblock(2);
% torque = (2*g.r.ppairs/n_p)*mo_blockintegral(22)
% mo_clearblock;
mo_groupselectblock(1);     % stator laminations
mo_groupselectblock(11);    % stator windings
torque = (2*g.r.ppairs/g.n_p)*mo_blockintegral(22);
mo_clearblock;

end
