import template from 'lodash/string/template';

export function bootstrap() {
    let compiled = template('Hello <%= user %>! DOM is ready.');
    console.log(compiled({ user: 'World' }));
};
