function distanceM= dist_cvx(drho,D,m)
cvx_solver sdpt3
cvx_begin quiet
    variables u(m,1)
    minimize (norm(u,1))
    subject to
        drho+D*u == 0;
cvx_end

    distanceM=cvx_optval;