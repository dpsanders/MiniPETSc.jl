@testset "Mat.jl" begin
    begin
        mat = PetscMat()

        setSize!(mat, m_local=(Int32)(3), n_local=(Int32)(4))
        @test mat.sized

        setPreallocation!(mat, (Int32)[3, 3, 2], (Int32)[0,0,0])
        @test mat.preallocated

        # Test individual assignment
        mat[1,2] = 1.2

        assemble!(mat)

        @test size(mat) == (3,4)

        @test mat[1,2] == 1.2
    end

    begin
        mat = PetscMat()

        setSize!(mat, m_local=(Int32)(3), n_local=(Int32)(4))
        @test mat.sized

        setPreallocation!(mat, (Int32)[3, 3, 2], (Int32)[0,0,0])
        @test mat.preallocated

        # Test range assignment
        mat[1:2,2:3] = (Float64)[1 2; 3 4]

        assemble!(mat)

        @test size(mat) == (3,4)
        @test mat[1:2,2:3] == (Float64)[1 2; 3 4]
    end

    begin
        mat = PetscMat()

        setSize!(mat, m_local=(Int32)(3), n_local=(Int32)(4))
        @test mat.sized

        setPreallocation!(mat, (Int32)[3, 3, 2], (Int32)[0,0,0])
        @test mat.preallocated

        # Test Matrix Assignment
        mat[[1,3],[2,3]] = (Float64)[1 2; 3 4]

        assemble!(mat)

        @test size(mat) == (3,4)
        @test mat[1:3,2:3] == (Float64)[1 2; 0 0; 3 4]
    end
end
