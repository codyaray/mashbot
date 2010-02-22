input metauml;

beginfig(1);
  Actor.user("User");
  Package.sns("Social Networking","Services (external)")();
  
  Package.campaignmanager("Campaign","Manager")();
  Package.core("Publication and Aggregation", "Platform")();
  Package.worker("Worker")();
  Package.db("Database")();
  
  user.w = (0,0);
  campaignmanager.w = user.e + (40, 0);
  worker.w = campaignmanager.e + (40, 0);
  db.s = campaignmanager.n + (0, 30);
  core.w = worker.e + (40, 0);
  sns.w = core.e + (40, 0);

  drawObjects(user,sns,campaignmanager,core, worker, db);
  
  link(association)(user.e -- campaignmanager.w);
% link(associationUni)(core.w -- user.e)
  link(association)(campaignmanager.e -- worker.w);
  link(association)(worker.e -- core.w);
  link(association)(core.e -- sns.w);
  link(association)(campaignmanager.n -- db.s);
  
endfig;

end;
