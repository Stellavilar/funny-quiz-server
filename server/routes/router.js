const express = require ('express');

const router = express.Router();

router.get('/', (req,res) => {
    return res.send("Hello my world!");
})

/***Quizzes Routes */
const quizController = require ('../controllers/quizController');

router.get('/quizzes', quizController.findAll);
router.get('/quizzes/:id', quizController.findByPk);
router.get('/quizzes/tag/:id', quizController.findByTag);
router.get('/quizzes/level/:id', quizController.findByLevel);
router.get('/quizzes/subcategory/:id', quizController.findSubcategory);
router.get('/tags/:tagId/levels/:levelId', quizController.findByTagAndLevel);

/**Tags Routes */
const tagController = require ('../controllers/tagController');

router.get('/tags', tagController.findAll);
router.get('/tags/:id', tagController.findByPk);

/**LevelS Routes */
const levelController = require('../controllers/levelController');

router.get('/levels', levelController.findAll);
router.get('/levels/:id', levelController.findByPk);

/**Answers Routes */
const answerController = require ('../controllers/answerController');

router.get('/answers', answerController.findAll);
router.get('/answers/:id', answerController.findByPk);

/**Subcategories Routes */
const subCategoryController = require ('../controllers/subCategoryController');

router.get('/subcategories', subCategoryController.findAll);
router.get('/subcategory/:id', subCategoryController.findByPk);


/**Users Routes */
const userController = require ('../controllers/userController');

router.post('/add', userController.add);
router.get('/users', userController.findAll);
router.get('/users/:id', userController.findByPk);
router.get('/userbytoken', userController.findByToken);
router.patch('/edit/:id', userController.edit);
router.delete('/delete/:id', userController.delete);

/**Login and Logout routes */
const loginController = require ('../controllers/loginController');

router.post('/api/login', loginController.login);
router.get('/api/logout', loginController.logout);

/**Search routes */
const searchController = require ('../controllers/searchController');

router.get('/quiz/subcategory', searchController.subCategory);

/**Scores routes */
const scoreController = require ('../controllers/scoreController');

router.get('/scores', scoreController.findAll);
router.get('/scores/:id', scoreController.findByPk);
router.get('/scoresbyuser/user/:id', scoreController.findByUser)
router.post('/user/:id/scores', scoreController.add);


module.exports = router;