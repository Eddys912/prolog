<div align="center">
  <h1>💻 Prolog Exercises 💻</h1>
  <p>Logic programming exercises in <strong>Prolog</strong></p>

![Prolog](https://img.shields.io/badge/Prolog-E61B23?logo=prolog&logoColor=E61B23&labelColor=fff&color=E61B23)
![Arch](https://img.shields.io/badge/Arch-1793D1?logo=archlinux&logoColor=1793D1&labelColor=fff&color=1793D1)
![SWI-Prolog](https://img.shields.io/badge/SWI--Prolog-E61B23?logo=swiprolog&logoColor=E61B23&labelColor=fff&color=E61B23)

</div>

## 🌟 Description

This repository contains programming exercises in **Prolog** using the logic programming paradigm. Practical examples include:

- Facts, Rules and Conclusions **(FRC)**.
- Logical reasoning and inferences.
- Declarative programming and recursion.
- Queries and predicate unification.

## 📂 Exercises

| #   | Exercise                  | Level | Description                                                     |
| --- | ------------------------- | ----- | --------------------------------------------------------------- |
| 1   | **Animal Hierarchy**      | 🟢    | Hierarchical relationship of animals (dogs, cats).              |
| 2   | **Human Responsibility**  | 🟢    | Relationship of responsibility based on conscience and freedom. |
| 3   | **Activities by Weather** | 🟢    | Relationship between activities based on weather.               |
| 4   | **Thieves and Jewels**    | 🟡    | Relationship between thieves, merchants, jewels and metals.     |
| 5   | **School System**         | 🟡    | Relationships between teachers, students and subjects.          |
| 6   | **X-Men Combat**          | 🟡    | Relationships of mutants with levels and powers.                |
| 7   | **Multiplication Table**  | 🟡    | Recursive multiplication table generator.                       |
| 8   | **General Menu**          | 🔴    | Menu to access different recursive programs.                    |

## 📋 Installation Requirements

- **Operating System**: Linux (Arch, Debian, Ubuntu, etc.) or WSL2 on Windows.
- **Architecture**: x86-64 (64-bit).
- **SWI-Prolog**: version 10.0.0 or higher.

## 🚀 How to Run the Exercises

### 🖥️ WSL Arch (Recommended)

1. **Clone the repository** on your machine:
   ```bash
   git clone https://github.com/edavsys/prolog-logic-fundamentals.git
   ```
2. **Download and install WSL Arch** in PowerShell:
   ```bash
   wsl --install -d archlinux
   ```
3. **Restart the machine**. Access archlinux.
4. **Install SWI-Prolog**:
   ```bash
   pacman -Syu
   pacman -S swi-prolog
   ```
5. **Verify installation**:
   ```bash
   swipl --version    # e.g. SWI-Prolog version 10.0.0
   ```
6. **Navigate to the exercises folder**. Adjust the path according to your repository location:
   ```bash
   cd /mnt/c/.../prolog-logic-fundamentals/exercises
   ```
7. **Run the program**:
   - Access the SWI-Prolog environment:
     ```bash
     swipl
     ```
   - Load the exercise file:
     ```prolog
     ['01_animal_hierarchy.pl'].
     ```

### 🌐 OneCompiler (No Installation Required)

Execute code without installation:

1. Open **[OneCompiler - Prolog](https://onecompiler.com/prolog)**.
2. Copy and paste the exercise code.
3. If the exercise requires user input:
   - Go to the **STDIN** panel.
   - Enter values separated by spaces.
4. Click **Run**.

## 📖 Official Documentation

To learn more:

- **[SWI-Prolog Documentation](https://www.swi-prolog.org/pldoc/index.html)** - Complete SWI-Prolog manual.
- **[Learn Prolog Now!](https://www.let.rug.nl/bos/lpn//lpnpage.php)** - Interactive Prolog tutorial.

<div align="center">
  <br>
  <img
    src="https://img.shields.io/badge/Made%20with-Prolog%20%26%20Logic-E61B23?style=for-the-badge"
    alt="Made with Prolog"
  />
  <br><br>
  <p>⭐ <strong>If you find this useful, consider leaving a star</strong> ⭐</p>
</div>
