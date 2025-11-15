import { Icon } from "@iconify/react";

export function Progress() {
	return (
		<div className="flex flex-col h-full bg-background">
			<div className="flex-1 overflow-y-auto pb-20">
				<div className="px-6 pt-8 pb-4">
					<h1 className="text-2xl font-bold font-heading text-foreground mb-4">Progress</h1>
					<div className="flex gap-2">
						<button className="px-5 py-2 bg-primary text-primary-foreground rounded-full text-sm font-semibold">
							Weekly
						</button>
						<button className="px-5 py-2 bg-card text-muted-foreground rounded-full text-sm font-semibold">
							Monthly
						</button>
						<button className="px-5 py-2 bg-card text-muted-foreground rounded-full text-sm font-semibold">
							Yearly
						</button>
					</div>
				</div>
				<div className="px-6 pb-6">
					<h2 className="text-base font-bold font-heading text-foreground mb-3">Key Metrics</h2>
					<div className="grid grid-cols-2 gap-4">
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<span className="text-muted-foreground text-xs">Completed</span>
								<Icon icon="solar:check-circle-bold" className="size-5 text-primary" />
							</div>
							<p className="text-2xl font-bold text-card-foreground mb-1">24</p>
							<div className="flex items-center text-xs">
								<Icon icon="solar:arrow-up-bold" className="size-3 text-primary mr-1" />
								<span className="text-primary font-semibold">12%</span>
								<span className="text-muted-foreground ml-1">vs last week</span>
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<span className="text-muted-foreground text-xs">Total Minutes</span>
								<Icon icon="solar:clock-circle-bold" className="size-5 text-primary" />
							</div>
							<p className="text-2xl font-bold text-card-foreground mb-1">360</p>
							<div className="flex items-center text-xs">
								<Icon icon="solar:arrow-up-bold" className="size-3 text-primary mr-1" />
								<span className="text-primary font-semibold">8%</span>
								<span className="text-muted-foreground ml-1">vs last week</span>
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<span className="text-muted-foreground text-xs">Day Streak</span>
								<Icon icon="solar:fire-bold" className="size-5 text-primary" />
							</div>
							<p className="text-2xl font-bold text-card-foreground mb-1">7</p>
							<div className="flex items-center text-xs">
								<Icon icon="solar:arrow-up-bold" className="size-3 text-primary mr-1" />
								<span className="text-primary font-semibold">2 days</span>
								<span className="text-muted-foreground ml-1">from last</span>
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<span className="text-muted-foreground text-xs">Points Earned</span>
								<Icon icon="solar:star-bold" className="size-5 text-primary" />
							</div>
							<p className="text-2xl font-bold text-card-foreground mb-1">480</p>
							<div className="flex items-center text-xs">
								<Icon icon="solar:arrow-up-bold" className="size-3 text-primary mr-1" />
								<span className="text-primary font-semibold">15%</span>
								<span className="text-muted-foreground ml-1">vs last week</span>
							</div>
						</div>
					</div>
				</div>
				<div className="px-6 pb-6">
					<h2 className="text-base font-bold font-heading text-foreground mb-3">
						Challenge Completion
					</h2>
					<div className="bg-card rounded-2xl p-5">
						<div className="flex items-end justify-between gap-2 h-40 mb-3">
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-24" />
								<span className="text-xs text-muted-foreground">Mon</span>
							</div>
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-32" />
								<span className="text-xs text-muted-foreground">Tue</span>
							</div>
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-28" />
								<span className="text-xs text-muted-foreground">Wed</span>
							</div>
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-20" />
								<span className="text-xs text-muted-foreground">Thu</span>
							</div>
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-32" />
								<span className="text-xs text-muted-foreground">Fri</span>
							</div>
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-16" />
								<span className="text-xs text-muted-foreground">Sat</span>
							</div>
							<div className="flex-1 flex flex-col justify-end items-center gap-2">
								<div className="w-full bg-primary rounded-lg h-24" />
								<span className="text-xs text-muted-foreground">Sun</span>
							</div>
						</div>
						<div className="flex items-center justify-center gap-4 pt-3 border-t border-border">
							<div className="flex items-center gap-2">
								<div className="size-3 bg-primary rounded" />
								<span className="text-xs text-muted-foreground">Completed</span>
							</div>
						</div>
					</div>
				</div>
				<div className="px-6 pb-6">
					<h2 className="text-base font-bold font-heading text-foreground mb-3">
						Activity Breakdown
					</h2>
					<div className="space-y-3">
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-3">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:meditation-round-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Breathing</h3>
										<p className="text-xs text-muted-foreground">8 sessions</p>
									</div>
								</div>
								<div className="text-right">
									<p className="font-bold text-card-foreground">120 min</p>
									<p className="text-xs text-primary font-semibold">33%</p>
								</div>
							</div>
							<div className="w-full h-2 bg-muted rounded-full overflow-hidden">
								<div className="h-full bg-primary rounded-full w-1/3" />
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-3">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:walking-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Movement</h3>
										<p className="text-xs text-muted-foreground">6 sessions</p>
									</div>
								</div>
								<div className="text-right">
									<p className="font-bold text-card-foreground">90 min</p>
									<p className="text-xs text-primary font-semibold">25%</p>
								</div>
							</div>
							<div className="w-full h-2 bg-muted rounded-full overflow-hidden">
								<div className="h-full bg-primary rounded-full w-1/4" />
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-3">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:bolt-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Energy</h3>
										<p className="text-xs text-muted-foreground">5 sessions</p>
									</div>
								</div>
								<div className="text-right">
									<p className="font-bold text-card-foreground">75 min</p>
									<p className="text-xs text-primary font-semibold">21%</p>
								</div>
							</div>
							<div className="w-full h-2 bg-muted rounded-full overflow-hidden">
								<div className="h-full bg-primary rounded-full w-1/5" />
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-3">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:target-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Focus</h3>
										<p className="text-xs text-muted-foreground">5 sessions</p>
									</div>
								</div>
								<div className="text-right">
									<p className="font-bold text-card-foreground">75 min</p>
									<p className="text-xs text-primary font-semibold">21%</p>
								</div>
							</div>
							<div className="w-full h-2 bg-muted rounded-full overflow-hidden">
								<div className="h-full bg-primary rounded-full w-1/5" />
							</div>
						</div>
					</div>
				</div>
				<div className="px-6 pb-6">
					<h2 className="text-base font-bold font-heading text-foreground mb-3">Recent Activity</h2>
					<div className="space-y-3">
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:meditation-round-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">
											Morning Breathing
										</h3>
										<p className="text-xs text-muted-foreground">Today, 8:30 AM</p>
									</div>
								</div>
								<div className="text-right">
									<p className="text-sm font-bold text-primary">+20 pts</p>
								</div>
							</div>
							<div className="flex items-center gap-4 pt-2">
								<div className="flex items-center gap-1">
									<Icon icon="solar:clock-circle-bold" className="size-4 text-muted-foreground" />
									<span className="text-xs text-muted-foreground">15 min</span>
								</div>
								<div className="flex items-center gap-1">
									<Icon icon="solar:bolt-bold" className="size-4 text-primary" />
									<span className="text-xs text-muted-foreground">High</span>
								</div>
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:walking-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Evening Walk</h3>
										<p className="text-xs text-muted-foreground">Yesterday, 6:15 PM</p>
									</div>
								</div>
								<div className="text-right">
									<p className="text-sm font-bold text-primary">+30 pts</p>
								</div>
							</div>
							<div className="flex items-center gap-4 pt-2">
								<div className="flex items-center gap-1">
									<Icon icon="solar:clock-circle-bold" className="size-4 text-muted-foreground" />
									<span className="text-xs text-muted-foreground">30 min</span>
								</div>
								<div className="flex items-center gap-1">
									<Icon icon="solar:bolt-bold" className="size-4 text-primary" />
									<span className="text-xs text-muted-foreground">Medium</span>
								</div>
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:target-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Focus Session</h3>
										<p className="text-xs text-muted-foreground">Yesterday, 2:00 PM</p>
									</div>
								</div>
								<div className="text-right">
									<p className="text-sm font-bold text-primary">+25 pts</p>
								</div>
							</div>
							<div className="flex items-center gap-4 pt-2">
								<div className="flex items-center gap-1">
									<Icon icon="solar:clock-circle-bold" className="size-4 text-muted-foreground" />
									<span className="text-xs text-muted-foreground">20 min</span>
								</div>
								<div className="flex items-center gap-1">
									<Icon icon="solar:bolt-bold" className="size-4 text-primary" />
									<span className="text-xs text-muted-foreground">High</span>
								</div>
							</div>
						</div>
						<div className="bg-card rounded-2xl p-5">
							<div className="flex items-center justify-between mb-2">
								<div className="flex items-center gap-3">
									<div className="size-10 bg-secondary rounded-full flex items-center justify-center">
										<Icon icon="solar:bolt-bold" className="size-5 text-primary" />
									</div>
									<div>
										<h3 className="font-semibold text-card-foreground text-sm">Energy Boost</h3>
										<p className="text-xs text-muted-foreground">2 days ago, 10:30 AM</p>
									</div>
								</div>
								<div className="text-right">
									<p className="text-sm font-bold text-primary">+15 pts</p>
								</div>
							</div>
							<div className="flex items-center gap-4 pt-2">
								<div className="flex items-center gap-1">
									<Icon icon="solar:clock-circle-bold" className="size-4 text-muted-foreground" />
									<span className="text-xs text-muted-foreground">10 min</span>
								</div>
								<div className="flex items-center gap-1">
									<Icon icon="solar:bolt-bold" className="size-4 text-primary" />
									<span className="text-xs text-muted-foreground">Low</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div className="px-6 pb-6">
					<button className="w-full py-4 bg-primary text-primary-foreground rounded-2xl font-semibold flex items-center justify-center gap-2">
						<Icon icon="solar:download-bold" className="size-5" />
						<span>Export Progress Report</span>
					</button>
				</div>
			</div>
			<div className="fixed bottom-0 left-0 right-0 bg-background border-t border-border">
				<div className="flex items-center justify-around px-4 py-3">
					<button className="flex flex-col items-center justify-center gap-1 min-w-16">
						<Icon icon="solar:home-2-bold" className="size-6 text-primary" />
						<span className="text-xs font-medium text-muted-foreground">Home</span>
					</button>
					<button className="flex flex-col items-center justify-center gap-1 min-w-16">
						<Icon icon="solar:target-bold" className="size-6 text-primary" />
						<span className="text-xs font-medium text-muted-foreground">Challenges</span>
					</button>
					<button className="flex flex-col items-center justify-center gap-1 min-w-16">
						<div className="size-12 bg-primary rounded-full flex items-center justify-center -mt-6 mb-1 shadow-lg">
							<Icon icon="solar:add-circle-bold" className="size-7 text-primary-foreground" />
						</div>
						<span className="text-xs font-medium text-muted-foreground">Create</span>
					</button>
					<button className="flex flex-col items-center justify-center gap-1 min-w-16">
						<Icon icon="solar:chart-2-bold" className="size-6 text-primary" />
						<span className="text-xs font-medium text-primary">Progress</span>
					</button>
					<button className="flex flex-col items-center justify-center gap-1 min-w-16">
						<Icon icon="solar:user-bold" className="size-6 text-primary" />
						<span className="text-xs font-medium text-muted-foreground">Profile</span>
					</button>
				</div>
			</div>
		</div>
	);
}
