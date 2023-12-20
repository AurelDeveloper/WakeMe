import CoreMotion

class StepCounter {
    @State private var stepsCount: Bool = false
    private var stepsCounter: Int = 0
    private let targetSteps = 30

    init() {
        startCountingSteps()
    }

    func startCountingSteps() {
        guard CMMotionActivityManager.isActivityAvailable() else {
            return
        }

        let motionManager = CMMotionActivityManager()

        motionManager.startActivityUpdates(to: OperationQueue.main) { [weak self] (activity: CMMotionActivity?) in
            if let isWalking = activity?.walking, isWalking {
                self?.stepsCounter += 1
                if self?.stepsCounter == self?.targetSteps {
                    self?.stepsCount = true
                    self?.stepsCountReachedAction()
                }
            }
        }
    }

    func stepsCountReachedAction() {
        // Hier kannst du weitere Aktionen ausführen, wenn 30 Schritte erreicht sind
        print("30 Schritte erreicht!")
    }
}

// Beispiel-Nutzung:
let stepCounter = StepCounter()

