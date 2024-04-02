#ifndef COURSE_TRY_2_SIGMOID_ACTIVATION_CUH
#define COURSE_TRY_2_SIGMOID_ACTIVATION_CUH

#include "nn_layer.cuh"
#include "../utils/nn_exeption.cuh"
class SigmoidActivation : public NNLayer{
private:
    Matrix A;

    Matrix Z;
    Matrix dZ;
public:
    SigmoidActivation(std::string name);
    ~SigmoidActivation();

    Matrix& forward(Matrix& Z);
    Matrix& backprop(Matrix& dA, float learning_rate = 0.01);
    void update();
    NNLayer* copy() const;
    void forwardGPU(Matrix& Z, cudaStream_t stream);
    void backpropGPU(Matrix& dA, float learning_rate, cudaStream_t stream);

    void updateGPU();

    void accumulateDeltaGPU(NNLayer *layer, cudaStream_t stream);

};


#endif //COURSE_TRY_2_SIGMOID_ACTIVATION_CUH
