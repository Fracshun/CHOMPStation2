import { useBackend } from '../backend';
import { Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  plasma;
  oxygen;
};

export const TankDispenser = (props) => {
  const { act, data } = useBackend<Data>();
  const { plasma, oxygen } = data;
  return (
    <Window width={275} height={103}>
      <Window.Content>
        <Section>
          <LabeledList>
            <LabeledList.Item
              label="Phoron"
              buttons={
                <Button
                  icon={plasma ? 'square' : 'square-o'}
                  disabled={!plasma}
                  onClick={() => act('plasma')}
                >
                  Dispense
                </Button>
              }
            >
              {plasma}
            </LabeledList.Item>
            <LabeledList.Item
              label="Oxygen"
              buttons={
                <Button
                  icon={oxygen ? 'square' : 'square-o'}
                  disabled={!oxygen}
                  onClick={() => act('oxygen')}
                >
                  Dispense
                </Button>
              }
            >
              {oxygen}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
