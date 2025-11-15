import { Icon } from "@iconify/react";

export function ChallengeEnergySelection() {
	return (
		<div className="flex flex-col h-full bg-background">
			<div className="flex-1 overflow-y-auto pb-20">
				<div className="flex items-center justify-between px-6 py-4 border-b border-border">
					<button className="flex items-center justify-center size-11">
						<Icon icon="solar:arrow-left-linear" className="size-6 text-foreground" />
					</button>
					<h1 className="text-lg font-semibold font-heading text-foreground">Create Challenge</h1>
					<div className="size-11" />
				</div>
				<div className="px-6 pt-6 pb-4">
					<div className="flex items-center gap-2 mb-6">
						<div className="h-1.5 flex-1 bg-primary rounded-full" />
						<div className="h-1.5 flex-1 bg-primary rounded-full" />
						<div className="h-1.5 flex-1 bg-primary rounded-full" />
						<div className="h-1.5 flex-1 bg-muted rounded-full" />
						<div className="h-1.5 flex-1 bg-muted rounded-full" />
						<div className="h-1.5 flex-1 bg-muted rounded-full" />
						<div className="h-1.5 flex-1 bg-muted rounded-full" />
					</div>
					<p className="text-sm text-muted-foreground mb-1">Step 3 of 7</p>
					<h2 className="text-2xl font-bold font-heading text-foreground mb-2">
						Choose Your Energy Level
					</h2>
					<p className="text-muted-foreground">
						Select the intensity that matches your current capacity
					</p>
				</div>
				<div className="px-6 pb-6 space-y-4">
					<button className="w-full bg-card rounded-2xl p-6 border-2 border-primary flex items-center text-left">
						<div className="size-16 bg-secondary rounded-2xl flex items-center justify-center mr-4 flex-shrink-0">
							<span className="text-3xl">😌</span>
						</div>
						<div className="flex-1">
							<h3 className="text-lg font-semibold text-card-foreground mb-1">Low</h3>
							<p className="text-sm text-muted-foreground">
								Gentle activities that fit easily into your day
							</p>
						</div>
					</button>
					<button className="w-full bg-card rounded-2xl p-6 border-2 border-border flex items-center text-left">
						<div className="size-16 bg-secondary rounded-2xl flex items-center justify-center mr-4 flex-shrink-0">
							<span className="text-3xl">⚡</span>
						</div>
						<div className="flex-1">
							<h3 className="text-lg font-semibold text-card-foreground mb-1">Medium</h3>
							<p className="text-sm text-muted-foreground">
								Moderate activities with balanced effort
							</p>
						</div>
					</button>
					<button className="w-full bg-card rounded-2xl p-6 border-2 border-border flex items-center text-left">
						<div className="size-16 bg-secondary rounded-2xl flex items-center justify-center mr-4 flex-shrink-0">
							<span className="text-3xl">🔥</span>
						</div>
						<div className="flex-1">
							<h3 className="text-lg font-semibold text-card-foreground mb-1">High</h3>
							<p className="text-sm text-muted-foreground">
								Challenging activities for maximum impact
							</p>
						</div>
					</button>
				</div>
			</div>
			<div className="px-6 py-4 bg-background border-t border-border">
				<button className="w-full py-4 px-6 bg-primary text-primary-foreground rounded-2xl font-semibold text-base">
					Continue
				</button>
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
						<span className="text-xs font-medium text-primary">Create</span>
					</button>
					<button className="flex flex-col items-center justify-center gap-1 min-w-16">
						<Icon icon="solar:chart-2-bold" className="size-6 text-primary" />
						<span className="text-xs font-medium text-muted-foreground">Progress</span>
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
